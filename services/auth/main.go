package main

import (
	"context"
	"fmt"
	"log"
	"net/http"
	"os"
	"strings"

	"github.com/MicahParks/keyfunc/v3"
	"github.com/golang-jwt/jwt/v5"
)

var jwks keyfunc.Keyfunc

func main() {
	jwksURL := mustEnv("CLERK_JWKS_URL")
	port := getEnvOrDefault("PORT", "3002")

	var err error
	jwks, err = keyfunc.NewDefaultCtx(context.Background(), []string{jwksURL})
	if err != nil {
		log.Fatalf("failed to initialize JWKS from %s: %v", jwksURL, err)
	}

	mux := http.NewServeMux()
	mux.HandleFunc("/health", healthHandler)
	mux.HandleFunc("/verify", verifyHandler)

	log.Printf("auth service listening on :%s", port)
	log.Fatal(http.ListenAndServe(":"+port, mux))
}

func healthHandler(w http.ResponseWriter, _ *http.Request) {
	fmt.Fprint(w, "OK")
}

// verifyHandler is called by Traefik's forwardAuth middleware for every protected
// request. It validates the Clerk JWT and, on success, sets X-User-Email so
// Traefik can forward it to the downstream service.
func verifyHandler(w http.ResponseWriter, r *http.Request) {
	// CORS preflight requests carry no credentials — let them through so the
	// backend's own CORS middleware can respond with the correct headers.
	if r.Method == http.MethodOptions {
		w.WriteHeader(http.StatusOK)
		return
	}

	auth := r.Header.Get("Authorization")
	tokenStr, found := strings.CutPrefix(auth, "Bearer ")
	if !found || tokenStr == "" {
		http.Error(w, "missing bearer token", http.StatusUnauthorized)
		return
	}

	token, err := jwt.Parse(tokenStr, jwks.Keyfunc)
	if err != nil || !token.Valid {
		http.Error(w, fmt.Sprintf("invalid token: %v", err), http.StatusUnauthorized)
		return
	}

	claims, ok := token.Claims.(jwt.MapClaims)
	if !ok {
		http.Error(w, "invalid token claims", http.StatusUnauthorized)
		return
	}

	email, ok := claims["email"].(string)
	if !ok || email == "" {
		http.Error(w, "email claim missing — add it to your Clerk JWT template", http.StatusUnauthorized)
		return
	}

	w.Header().Set("X-User-Email", email)
	w.WriteHeader(http.StatusOK)
}

func mustEnv(key string) string {
	v := os.Getenv(key)
	if v == "" {
		log.Fatalf("required env var %s is not set", key)
	}
	return v
}

func getEnvOrDefault(key, def string) string {
	if v := os.Getenv(key); v != "" {
		return v
	}
	return def
}
