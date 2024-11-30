-- Crear tabla 'categoria' si no existe
CREATE TABLE IF NOT EXISTS categoria (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    imagen VARCHAR(255),
    nombre VARCHAR(255) NOT NULL,
    titulo VARCHAR(255),
    descripcion TEXT
);

-- Crear tabla 'producto' si no existe
CREATE TABLE IF NOT EXISTS producto (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    categoria_id BIGINT,
    imagen VARCHAR(255),
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2),
    FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

-- Insertar categorías si no existen
INSERT INTO categoria (imagen, nombre, titulo, descripcion) VALUES
('https://image.lexica.art/full_webp/1abd3b65-eff8-4d54-8126-17cf2836e43b', 'PERRO', 'ALIMENTOS PARA PERROS', 'Una alimentación balanceada es fundamental para mantener la salud y bienestar de los perros. Les proporciona los nutrientes esenciales que necesitan para tener energía, fortalecer su sistema inmunológico y mantener un pelaje sano. Además, previene enfermedades asociadas con deficiencias o excesos nutricionales, como problemas digestivos, obesidad y afecciones cardíacas. Al ofrecer una dieta equilibrada, se asegura un crecimiento adecuado en cachorros y un envejecimiento saludable en perros adultos.'),
('https://image.lexica.art/full_webp/172f1484-6fb9-49cf-9a71-6c13bb760402', 'GATO', 'ALIMENTOS PARA GATOS', 'La alimentación balanceada en los gatos es crucial para su salud y longevidad, ya que son animales carnívoros estrictos y necesitan nutrientes específicos como la taurina, que solo obtienen de fuentes animales. Una dieta equilibrada les proporciona las proteínas, vitaminas y minerales necesarios para mantener sus músculos fuertes, su pelaje brillante y su sistema inmunológico en óptimas condiciones. Además, una buena alimentación previene problemas comunes como enfermedades urinarias, obesidad y diabetes. Proporcionarles una dieta adecuada asegura su bienestar y una vida más saludable.'),
('https://cards.algoreducation.com/_next/image?url=https%3A%2F%2Ffiles.algoreducation.com%2Fproduction-ts%2F__S3__c7523d33-44cf-4dbf-b4be-607bdc0837dd&w=3840&q=75', 'RACIONES', 'RACIONES PARA ANIMALES', 'Las raciones para animales son una excelente opción para alimentar a tus mascotas de forma equilibrada y saludable. Están formuladas con ingredientes de alta calidad que les proporcionan los nutrientes esenciales que necesitan para mantenerse sanos y activos. Además, son fáciles de dosificar y almacenar, lo que las convierte en una alternativa práctica y conveniente para alimentar a tus mascotas. Con las raciones para animales, puedes estar seguro de que tus mascotas recibirán una alimentación completa y balanceada.'),
('https://media.istockphoto.com/id/877490114/es/foto/accesorios-del-perro-sobre-fondo-amarillo-vista-superior-concepto-de-animales-y-mascotas.jpg?s=612x612&w=0&k=20&c=5q2oC1LVv0FWpg_jWEND4wGNbzYWWW-zgG0fu5Xoavg=', 'ACCESORIOS', 'ACCESORIOS PARA MASCOTAS', 'Cuando juegues con tus mascotas, usa juguetes adecuados para su tamaño y evita juegos bruscos que puedan lastimarlas. El juego es una excelente forma de estimular su mente, fortalecer el vínculo y mantenerlas activas y saludables.'),
('https://static.vecteezy.com/system/resources/previews/007/633/685/non_2x/pet-shop-accessories-dog-and-cat-food-toys-and-cat-litter-bird-hamster-cage-veterinary-store-showcase-with-animal-comb-and-products-equipment-illustrations-free-vector.jpg', 'EQUIPAMIENTO', 'PRODUCTOS DE EQUIPAMIENTO', 'Variedad de productos para mascotas, desde jaulas, transportines, comederos, bebederos, camas, casas, rascadores, entre otros.'),
('https://image.lexica.art/full_webp/20052ae2-6e49-411a-998d-d087484a9e54', 'ANIMALES', 'ANIMALES', ''),
('https://image.lexica.art/full_webp/3b7a17ef-a4dc-4468-b0eb-58a3ece55dd4', 'FARMACIA', 'PRODUCTOS FARMACÉUTICOS', 'Los productos farmacéuticos para mascotas son una excelente opción para tratar y prevenir enfermedades y afecciones comunes en perros y gatos. Están formulados con ingredientes seguros y efectivos que ayudan a aliviar síntomas como picazón, dolor, etc.'),
('https://image.lexica.art/full_webp/b0d456d1-6ab2-46b3-8b75-cb52e5b9cf17', 'PLANTAS', 'PLANTAS Y FLORES', 'Las plantas y flores son una excelente opción para decorar tu hogar y darle un toque natural y fresco. Además, algunas plantas y flores tienen propiedades medicinales y aromáticas que pueden beneficiar la salud y bienestar de tus mascotas. Sin embargo, es importante tener en cuenta que algunas plantas y flores son tóxicas para perros y gatos, por lo que es importante informarse sobre cuáles son seguras y cuáles no antes de introducirlas en tu hogar.');

-- Insertar productos si no existen
INSERT INTO producto (categoria_id, imagen, nombre, descripcion, precio) 
VALUES
(2, 'https://distribuidoralopez.com.uy/wp-content/uploads/2024/06/D_602099-MLA76683488454_062024-F.jpg', 'Lager Premium - Gato Adulto', 'Alimento Lager Premium para gato adulto Sabor Mix - 7kg', 1.50),
(2, 'https://http2.mlstatic.com/D_NQ_NP_637188-MLU75047529898_032024-O.webp', 'Sushi Cat - Gato Adulto', 'Alimento Sushi Cat para gatos de todas las edades - 7kg', 10.5),
(2, 'https://devotouy.vtexassets.com/arquivos/ids/1532882-800-auto?v=638619544599500000&width=800&height=auto&aspect=true', 'Alimento PrimoGato Premium', 'Alimento PrimoGato para gatos castrados - 10kg', 1.5),
(2, 'https://buffettmascotas.com.uy/wp-content/uploads/2022/06/vittamax-correcto.jpg', 'Vitta Max - Gato Adulto', 'Alimento Vitta Max para gato adulto - 10kg', 1.5),
(2, 'https://www.matsudapet.com.br/img/produtos/vittamax-13.png', 'Viita Max - Gato Mix', 'Alimento Vitta Max para gatos de todas las edades - 10kg', 1.5),
(2, 'https://sanjuanmascotas.uy/cdn/shop/products/vittamax-gato-pescado_500x.png?v=1605883682', 'Vitta Max - Gato Peixe', 'Alimento Vitta Max sabor pescado - 10kg', 1.5),
(2, 'https://lasplaces.com.uy/wp-content/uploads/2021/07/CAT-CHOW-600x600.png', 'Purina Cat Chow', 'Alimento Purina Cat Chow para gato adulto sabor carne - 15kg', 1.5),
(1, 'https://veterinarialahacienda.com/cdn/shop/products/nurtican-adultos_01_b04c3199-c389-40c9-8534-21db45b11e75_1024x1024@2x.jpg?v=1648913746', 'Nutri Can - Perro Adulto', 'Alimento para perro adulto - 7kg + 1kg de regalo', 1.5),
(1, 'https://lasplaces.com.uy/wp-content/uploads/2021/07/lager-cachorro-corregido-600x380.png', 'Lager Premium Cachorros', 'Alimento para perros cachorros - 22 kg', 1.5),
(1, 'https://www.racionya.uy/wp-content/uploads/2020/09/maxinecachorros.png', 'Maxine Premium', 'Alimento para perros cachorros - 21kg', 1.5),
(1, 'https://sucanuy.vtexassets.com/arquivos/ids/186773-800-auto?v=637934433347400000&width=800&height=auto&aspect=true', 'Maxine Super Premium', 'Alimento para perros adultos - 21kg', 1.5),
(1, 'https://http2.mlstatic.com/D_NQ_NP_931561-MLA45768207715_042021-O.webp', 'Maxine Super Premium', 'Alimento para perros adultos sabor mix - 25kg', 1.5),
(1, 'https://nuevaerauruguay.com/wp-content/uploads/2021/07/7797453000666-product-image-1.png', 'Pedigree Adultos', 'Alimento para perros adultos sabor carne y vegetales - 21kg', 1.5),
(1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLxLQinCxWJKdPwyNjVbOR4GRaeKdnc5uMjA&s', 'Pedigree Razas Pequeñas', 'Alimentos para perros adultos de razas pequeñas - 21kg', 1.5),
(3, 'https://mundomascota.uy/wp-content/uploads/2024/09/D_737032-MLU43635783520_092020-F-1.jpg', 'Ración para Hamster', 'Mezcla balanceada para hámsteres.', 1.5),
(3, 'https://http2.mlstatic.com/D_Q_NP_2X_908630-MLU75573941483_042024-T.webp', 'Ración para Maragata', 'Mezcla variada de granos nutritivos.', 1.5),
(3, 'https://img.freepik.com/fotos-premium/bolsa-trigo_136670-58.jpg', 'Trigo', 'Grano nutritivo, ideal para aves y pequeños roedores.', 1.5),
(3, 'https://layswesternwearandfeed.com/cdn/shop/products/Ai-Weiweis-Sunflower-Seeds-Detail-Photo-3_500x500.jpg?v=1573231289', 'Girasol chico', 'Semillas pequeñas para aves y mascotas pequeñas.', 1.5),
(3, 'https://layswesternwearandfeed.com/cdn/shop/products/Ai-Weiweis-Sunflower-Seeds-Detail-Photo-3_500x500.jpg?v=1573231289', 'Girasol grande', 'Semillas grandes, ricas en nutrientes.', 1.5),
(3, 'https://http2.mlstatic.com/D_NQ_NP_846730-MLU45063818347_032021-O.webp', 'Maíz', 'Grano energético, adecuado para aves y roedores.', 1.5),
(3, 'https://http2.mlstatic.com/D_NQ_NP_741328-MLU52838324730_122022-O.webp', 'Alpiste', 'Semillas pequeñas ideales para aves pequeñas.', 1.5),
(3, 'https://www.icasa.com/wp-content/uploads/2022/02/vitp105-alimento-para-canarios-vit-pro-en-bolsa-5-kg_detalle_4406.jpg', 'Ración para Canarios', 'Mezcla especial para la alimentación de canarios.', 1.5),
(3, 'https://http2.mlstatic.com/D_NQ_NP_846730-MLU45063818347_032021-O.webp', 'Maíz pajarito', 'Maíz pequeño, adecuado para la dieta de aves.', 1.5),
(3, 'https://http2.mlstatic.com/D_NQ_NP_846730-MLU45063818347_032021-O.webp', 'Maíz entero', 'Grano completo, ideal para aves y animales grandes.', 1.5),
(3, 'https://petshopmdq.com/media/2020/03/MaizPisadoDOS.jpg', 'Maíz quebrado', 'Grano partido, ideal para aves pequeñas.', 1.5),
(4, 'https://www.icasa.com/wp-content/uploads/2024/04/da4002-arnes-de-nylon-premier-dog-negro_general_14274.jpg', 'Arnés', 'Arnés de nylon Premier Dog', 1.5),
(4, 'https://www.icasa.com/wp-content/uploads/2024/04/dr4020-correa-de-nylon-premier-dog-roja-120-cm_general_14317.jpg', 'Correa', 'Correa de nylon Premier Dog', 1.5),
(4, 'https://www.icasa.com/wp-content/uploads/2024/05/dr5082-correa-redonda-xt-dog-negra_general_13931.jpg', 'Correa redonda', 'Correa redonda varios colores', 1.5),
(4, 'https://www.icasa.com/wp-content/uploads/2023/02/db951-bozal-de-plastico-y-nylon_general_1097.jpg.webp', 'Bozal', 'Bozal de plástico y nylon', 1.5),
(4, 'https://www.icasa.com/wp-content/uploads/2023/06/rc1163-ramal-cromado-con-empunadura-en-cuero_general_3806.jpg.webp', 'Correa metálica', 'Correa metálica', 1.5),
(4, 'https://www.icasa.com/wp-content/uploads/2022/08/cdb30-collar-especial-para-doberman_general_585.jpg.webp', 'Collar metálico', 'Collar metálico varias medidas', 1.5),
(4, 'https://www.icasa.com/wp-content/uploads/2022/02/dl2101-collar-lisa-forrada-ica_general_1393.jpg.webp', 'Collar Liso', 'Collar liso varios colores', 1.5),
(4, 'https://www.icasa.com/wp-content/uploads/2024/04/jxt1102-tirador-con-pelota-plastica-dental-xt-dog-41-cm_general_14771.jpg', 'Tirador con pelota', 'Tirador con pelota plástica dental', 1.5),
(7, 'https://sucanuy.vtexassets.com/arquivos/ids/189695-1200-auto?v=638061036856700000&width=1200&height=auto&aspect=true','Pastilla Nexgard','Perros de 4 a 10kg',1.5),
(7, 'https://sucanuy.vtexassets.com/arquivos/ids/189686-1200-auto?v=638061033778400000&width=1200&height=auto&aspect=true','Pastilla Nexgard','Perros de 10 a 25kg',1.5),
(7, 'https://sucanuy.vtexassets.com/arquivos/ids/189692-1200-auto?v=638061036109000000&width=1200&height=auto&aspect=true','Pastilla Nexgard','Perros de 25 a 50kg',1.5),
(7, 'https://sucanuy.vtexassets.com/arquivos/ids/189680-1200-auto?v=638061028748400000&width=1200&height=auto&aspect=true','Pastilla Nexgard Spectra','Perros de 3.5 a 7kg',1.5),
(7, 'https://sucanuy.vtexassets.com/arquivos/ids/189684-1200-auto?v=638061033156600000&width=1200&height=auto&aspect=true','Pastilla Nexgard Spectra','Perros de 7.5 a 15kg',1.5),
(7, 'https://sucanuy.vtexassets.com/arquivos/ids/189676-1200-auto?v=638061026381630000&width=1200&height=auto&aspect=true','Pastilla Nexgard Spectra','Perros de 15 a 30kg',1.5),
(7, 'https://sucanuy.vtexassets.com/arquivos/ids/189682-1200-auto?v=638061029393270000&width=1200&height=auto&aspect=true','Pastilla Nexgard Spectra','Perros de 30 a 60kg',1.5),
(7, 'https://sucanuy.vtexassets.com/arquivos/ids/186328-1200-auto?v=637934430556900000&width=1200&height=auto&aspect=true','Collar Dominal para gatos','Antiparasitario externo para felinos.',1.5),
(7, 'https://sucanuy.vtexassets.com/arquivos/ids/186336-1200-auto?v=637934430600870000&width=1200&height=auto&aspect=true','Collar Dominal','Perros pequeños o cachorros',1.5),
(7, 'https://sucanuy.vtexassets.com/arquivos/ids/186335-1200-auto?v=637934430597730000&width=1200&height=auto&aspect=true','Collar Dominal','Perros medianos',1.5),
(7, 'https://sucanuy.vtexassets.com/arquivos/ids/186334-1200-auto?v=637934430594470000&width=1200&height=auto&aspect=true','Collar Dominal','Perros grandes',1.5),
(7, 'https://sucanuy.vtexassets.com/arquivos/ids/186333-1200-auto?v=637934430591330000&width=1200&height=auto&aspect=true','Collar Dominal','Perros extra grandes',1.5),
(8,'https://viverostarquinales.es/wp-content/uploads/2022/06/comprar-alegria-de-la-casa.jpg','Alegría','Planta colorida y resistente, ideal para interiores.',1.5),
(8,'https://www.floreriaargentina.com/productos/imgs/planta-de-anturio-3239-35.jpg','Anturio','Planta exótica con flores brillantes y duraderas.',1.5),
(8,'https://acdn.mitiendanube.com/stores/003/960/867/products/sin-titulo-3-eef7570717e4154b2317038119117640-1024-1024.jpg','Flor de azúcar','Utilizada en jardines para bordes o macetas, valorada por su fragancia y delicado aspecto.',1.5),
(5,'https://www.icasa.com/wp-content/uploads/2024/04/jcp1-jaulas-de-cria-para-pajaros-39-cm_general_9542.jpg','Jaula de cría','Jaula diseñada para la reproducción de aves.',1.5),
(5,'https://www.icasa.com/wp-content/uploads/2024/04/pp360-transportin-premier-dog-celeste_general_13751.jpg','Transportin Premier Dog','Transporte para perros y gatos',1.5),
(5,'https://http2.mlstatic.com/D_NQ_NP_901214-MLU45115173878_032021-O.webp','Bebedero','para picaflores, colibríes y abejas con techo',1.5);
