insert into dim_classes (name)
values ('Твердые материалы');
insert into dim_classes (name)
values ('Жидкости');

insert into dim_group (id_class, name)
values (1, 'Металлы');
insert into dim_group (id_class, name)
values (1, 'Дерево');
insert into dim_group (id_class, name)
values (1, 'Пластик');
insert into dim_group (id_class, name)
values (2, 'Горючие жидкости');
insert into dim_group (id_class, name)
values (2, 'Негорючие жидкости');

insert into dim_units (name)
values ('Метр');
insert into dim_units (name)
values ('Килограмм');
insert into dim_units (name)
values ('Литр');

insert into dim_materials (id_group, name, id_unit, price)
values (4, 'Бензин', 3, 100);
insert into dim_materials (id_group, name, id_unit, price)
values (4, 'Керосин', 3, 200);
insert into dim_materials (id_group, name, id_unit, price)
values (5, 'Вода', 3, 50);

insert into dim_type_docs (type)
values ('Приход товара на склад');
insert into dim_type_docs (type)
values ('Уход товара со склада');

insert into dim_contractors (name, inn, legal_address, bank_address, bank_account)
values ('Natural Gas Distribution', 1148125809, '8 Lawn Trail', '94533 Blaine Circle', 5048372063627372);
insert into dim_contractors (name, inn, legal_address, bank_address, bank_account)
values ('Business Services', 2751723604, '4863 Clyde Gallagher Crossing', '438 Donald Court', 5108759223086639);
insert into dim_contractors (name, inn, legal_address, bank_address, bank_account)
values ('Containers/Packaging', 3284659273, '0 Melrose Pass', '7 Mayer Hill', 5048378546578496);
insert into dim_contractors (name, inn, legal_address, bank_address, bank_account)
values ('EDP Services', 4524196650, '8 Harper Street', '7 Arrowood Drive', 5048373871181248);
insert into dim_contractors (name, inn, legal_address, bank_address, bank_account)
values ('Major Banks', 5514307649, '393 David Pass', '501 Canary Park', 5108750885043620);
insert into dim_contractors (name, inn, legal_address, bank_address, bank_account)
values ('Investment Bankers/Brokers/Service', 1148125321, '6244 Portage Parkway', '9062 Gerald Point',
        5108755160134515);
insert into dim_contractors (name, inn, legal_address, bank_address, bank_account)
values ('Major Virgin', 1148125803, '1967 Memorial Parkway', '0387 Green Ridge Crossing', 5048375297600875);

insert into fact_docs (id_type, parent_doc_id, id_contractor, id_material, count)
values (1, null, 1, 1, 100),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1),
       (2, 1, 1, 1, 1);