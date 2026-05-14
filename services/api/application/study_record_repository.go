package application

import "pkg/domain"

type StudyRecordApplication struct {
	Repo domain.StudyRecordRepository
}

func (sra *StudyRecordApplication) Get(userUUID string) ([]*domain.StudyRecord, error) {
	return sra.Repo.Get(userUUID)
}

func (sra *StudyRecordApplication) Batch(records []*domain.StudyRecord) ([]*domain.StudyRecord, error) {
	return sra.Repo.Batch(records)
}
