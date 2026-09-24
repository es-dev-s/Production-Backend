-- Remember how many files were on a document when review rejects it and
-- the source rows are removed, so the member UI can still show N / 4.
ALTER TABLE documents
    ADD COLUMN IF NOT EXISTS source_count INT NOT NULL DEFAULT 0;
