    
INSERT INTO CLIENTE (nombre, apellido, email, telefono, direccion)
VALUES
('Juan', 'Pérez', 'juan.perez@example.com', '1234567890', 'Calle Falsa 123, Ciudad A'),
('María', 'González', 'maria.gonzalez@example.com', '0987654321', 'Avenida Siempre Viva 742, Ciudad B'),
('Pedro', 'Ramírez', 'pedro.ramirez@example.com', '1122334455', 'Boulevard Los Olivos 55, Ciudad C'),
('Ana', 'López', 'ana.lopez@example.com', '2233445566', 'Calle de la Rosa 77, Ciudad D'),
('Lucía', 'Martínez', 'lucia.martinez@example.com', '3344556677', 'Avenida del Sol 88, Ciudad E'),
('Carlos', 'Gómez', 'carlos.gomez@example.com', '4455667788', 'Calle Luna 99, Ciudad F'),
('Sofía', 'Fernández', 'sofia.fernandez@example.com', '5566778899', 'Avenida Estrella 101, Ciudad G'),
('Miguel', 'Torres', 'miguel.torres@example.com', '6677889900', 'Calle Mar 202, Ciudad H'),
('Laura', 'Ruiz', 'laura.ruiz@example.com', '7788990011', 'Boulevard del Mar 303, Ciudad I'),
('Diego', 'Mendoza', 'diego.mendoza@example.com', '8899001122', 'Calle Flor 404, Ciudad J');

INSERT INTO DISCO (titulo, interprete, genero, precio_compra, precio_venta, cantidad_disponible)
VALUES
('Dark Side of the Moon', 'Pink Floyd', 'Rock', 20.00, 30.00, 50),
('Thriller', 'Michael Jackson', 'Pop', 25.00, 40.00, 40),
('Back in Black', 'AC/DC', 'Rock', 22.00, 35.00, 60),
('Rumours', 'Fleetwood Mac', 'Rock', 18.00, 28.00, 45),
('Hotel California', 'Eagles', 'Rock', 20.00, 32.00, 55),
('Abbey Road', 'The Beatles', 'Rock', 23.00, 37.00, 50),
('1989', 'Taylor Swift', 'Pop', 20.00, 30.00, 70),
('The Wall', 'Pink Floyd', 'Rock', 25.00, 38.00, 40),
('Sgt. Pepper’s Lonely Hearts Club Band', 'The Beatles', 'Rock', 21.00, 34.00, 65),
('Born to Run', 'Bruce Springsteen', 'Rock', 19.00, 29.00, 50);

INSERT INTO PROVEEDOR (nombre, contacto, telefono, email, direccion)
VALUES
('VinylWorld', 'John Doe', '5551234567', 'john.doe@vinylworld.com', 'Calle Musica 123, Ciudad A'),
('MusicWarehouse', 'Jane Smith', '5557654321', 'jane.smith@musicwarehouse.com', 'Avenida Melodía 456, Ciudad B'),
('RecordMasters', 'Mike Johnson', '5551112222', 'mike.johnson@recordmasters.com', 'Boulevard Riff 789, Ciudad C'),
('DiscoHub', 'Alice Davis', '5553334444', 'alice.davis@discohub.com', 'Calle Armonía 101, Ciudad D'),
('VinylCity', 'Bob Brown', '5555556666', 'bob.brown@vinylcity.com', 'Avenida Rock 202, Ciudad E'),
('MelodyWorks', 'Clara Wilson', '5557778888', 'clara.wilson@melodyworks.com', 'Calle Jazz 303, Ciudad F'),
('BeatStore', 'Dave Taylor', '5559990000', 'dave.taylor@beatstore.com', 'Boulevard Soul 404, Ciudad G'),
('SoundFactory', 'Eve Miller', '5551122334', 'eve.miller@soundfactory.com', 'Calle Blues 505, Ciudad H'),
('RhythmCorner', 'Frank Harris', '5555566777', 'frank.harris@rhythmcorner.com', 'Avenida Funk 606, Ciudad I'),
('GrooveDepot', 'Grace Lee', '5557788990', 'grace.lee@groovedepot.com', 'Calle HipHop 707, Ciudad J');

INSERT INTO TRANSACCION (id_cliente, id_disco, tipo_transaccion, cantidad, precio_total)
VALUES
(1, 1, 'venta', 2, 60.00),
(2, 2, 'venta', 1, 40.00),
(3, 3, 'venta', 3, 105.00),
(4, 4, 'venta', 1, 28.00),
(5, 5, 'venta', 2, 64.00),
(6, 6, 'venta', 4, 148.00),
(7, 7, 'venta', 2, 60.00),
(8, 8, 'venta', 1, 38.00),
(9, 9, 'venta', 3, 102.00),
(10, 10, 'venta', 2, 58.00);

INSERT INTO INVENTARIO (id_disco, id_proveedor, cantidad_entrada)
VALUES
(1, 1, 100),
(2, 2, 80),
(3, 3, 150),
(4, 4, 90),
(5, 5, 110),
(6, 6, 130),
(7, 7, 120),
(8, 8, 100),
(9, 9, 140),
(10, 10, 130);