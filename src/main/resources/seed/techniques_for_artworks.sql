INSERT INTO technique (name, description)
VALUES
    ('Acrílico sobre lienzo', NULL),
    ('Carboncillo sobre papel', NULL),
    ('Pastel sobre papel', NULL),
    ('Óleo sobre lienzo', NULL),
    ('Óleo sobre tabla', NULL),
    ('Óleo sobre aluminio', NULL)
    ON CONFLICT (name) DO NOTHING;
