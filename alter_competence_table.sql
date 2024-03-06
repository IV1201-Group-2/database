-- Rename column 'name' to 'i18n_key'
ALTER TABLE competence RENAME COLUMN name TO i18n_key;

-- Update entries in 'i18n_key' column
UPDATE competence
SET i18n_key =
    CASE competence_id
        WHEN 1 THEN 'ticket-sales'
        WHEN 2 THEN 'lotteries'
        WHEN 3 THEN 'roller-coaster-operations'
        ELSE i18n_key
    END;
