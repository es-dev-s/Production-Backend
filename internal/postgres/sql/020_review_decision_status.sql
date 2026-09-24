-- Admin review outcomes: approved stays in the corpus; rejected is a
-- member-facing decision record only (files are removed on reject).
ALTER TABLE documents DROP CONSTRAINT IF EXISTS documents_status_check;
ALTER TABLE documents ADD CONSTRAINT documents_status_check
    CHECK (status IN (
        'processing',
        'completed',
        'duplicate',
        'pending_review',
        'approved',
        'rejected'
    ));
