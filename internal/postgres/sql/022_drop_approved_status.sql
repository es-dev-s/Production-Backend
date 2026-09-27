-- Approve uses duplicate/completed again. Rejected stays for declined uploads.
UPDATE documents SET status = 'duplicate' WHERE status = 'approved';

ALTER TABLE documents DROP CONSTRAINT IF EXISTS documents_status_check;
ALTER TABLE documents ADD CONSTRAINT documents_status_check
    CHECK (status IN (
        'processing',
        'completed',
        'duplicate',
        'pending_review',
        'rejected'
    ));
