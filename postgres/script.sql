CREATE TABLE IF NOT EXISTS ventas (
    id               SERIAL PRIMARY KEY,
    fecha            DATE           NOT NULL,
    producto         VARCHAR(100)   NOT NULL,
    categoria        VARCHAR(50)    NOT NULL,
    cantidad         INTEGER        NOT NULL,
    precio_unitario  NUMERIC(10,2)  NOT NULL,
    total            NUMERIC(10,2)  GENERATED ALWAYS AS (cantidad * precio_unitario) STORED
);

INSERT INTO ventas (fecha, producto, categoria, cantidad, precio_unitario) VALUES
  ('2026-01-05', 'Té Verde', 'Bebidas', 12, 1.20),
  ('2026-01-05', 'Chocolate Caliente', 'Bebidas', 19, 2.20),
  ('2026-01-05', 'Pan Integral', 'Panadería', 10, 1.10),
  ('2026-01-05', 'Empanada', 'Comidas', 15, 2.50),
  ('2026-01-05', 'Jugo de Manzana', 'Bebidas', 15, 2.50),
  ('2026-01-05', 'Tostado Mixto', 'Comidas', 15, 4.00),
  ('2026-01-06', 'Limonada', 'Bebidas', 23, 2.00),
  ('2026-01-06', 'Jugo de Naranja', 'Bebidas', 29, 2.50),
  ('2026-01-06', 'Muffin Arándanos', 'Panadería', 36, 2.00),
  ('2026-01-06', 'Bagel Salmón', 'Comidas', 15, 5.50);