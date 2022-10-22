import sqlite3

import pandas as pd


def query1(con: sqlite3.Connection) -> pd.DataFrame:
    """Получение всех материалов c классом Жидкости
    """
    return pd.read_sql("""
select dc.name             as class,
       dg.name             as "group",
       dim_materials.name  as material,
       dim_materials.price as price
from dim_materials
         inner join dim_group as dg on dg.id = dim_materials.id_group
         inner join dim_classes as dc on dc.id = dg.id_class
where dc.name = 'Жидкости'
    """, con=con)


def query2(con: sqlite3.Connection) -> pd.DataFrame:
    """Получение материалов с единицей измерения Литр
    """
    return pd.read_sql("""
select m.name
from dim_materials as m
         inner join dim_units du on du.id = m.id_unit
where du.name = 'Литр'
    """, con=con)


def query3(con: sqlite3.Connection) -> pd.DataFrame:
    """Получение количества материалов в каждой группе
    """
    return pd.read_sql("""
select dg.name        as name,
       count(dm.name) as count
from dim_group dg
         left outer join dim_materials dm on dg.id = dm.id_group
group by dg.name
    """, con=con)


def query4(con: sqlite3.Connection) -> pd.DataFrame:
    """Получение количества материалов в каждом классе
    """
    return pd.read_sql("""
select dim_classes.name as name,
       count(dm.name)   as count
from dim_classes
         left join dim_group dg on dim_classes.id = dg.id_class
         left join dim_materials dm on dg.id = dm.id_group
group by dim_classes.name
    """, con=con)


def query5(con: sqlite3.Connection) -> pd.DataFrame:
    """Получение текущего остатка на складе(c учетом всех документов)
    """
    return pd.read_sql("""
with current_stock as (select id_contractor,
                              id_material,
                              sum(case
                                      when id_type = 1 then count
                                      else -count end) as stock
                       from fact_docs
                       group by id_contractor, id_material)
select dc.name             as contractor,
       dm.name             as material,
       current_stock.stock as stock
from current_stock
         inner join dim_contractors as dc
                    on dc.id = current_stock.id_contractor
         inner join dim_materials as dm
                    on dm.id = current_stock.id_material
    """, con=con)


def query6(con: sqlite3.Connection) -> pd.DataFrame:
    """Получение товаров с максимальной ценной
    """
    return pd.read_sql("""
select name
from dim_materials
where price = (select max(price) from dim_materials)
""", con=con)


def query7(con: sqlite3.Connection) -> str:
    """Увеличить цену на 100 на все жидкости
    """
    con.execute("""
    update dim_materials
    set price = price + 100
    where id_group in (select dim_group.id
                       from dim_group
                                inner join dim_classes dc on dc.id = dim_group.id_class
                       where dc.name = 'Жидкости')    """)
    return 'done'


def query8(con: sqlite3.Connection) -> str:
    """Добавить единицу измеренич
    """
    con.execute("""
    insert into dim_units (name) values ('Дюйм');
    """)
    return 'done'


def main() -> None:
    con = sqlite3.connect("storehouse.sqlite")
    queries = [
        query1,
        query2,
        query3,
        query4,
        query5,
        query6,
        query7,
        query8
    ]
    for i, query in enumerate(queries):
        print(f'{i + 1}. {query.__doc__.strip()}')
        print(query(con))
    con.close()


if __name__ == '__main__':
    main()
