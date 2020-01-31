# Python SQLAlchemy

## Bulk update using Core

```python
from sqlalchemy.sql.expression import bindparam

images_tbl = 'images'
update_mappings = [
  {
    "id_": 42,
    "value1": "This is the answer",
  }
]

upd_stmt = (
  update(images_tbl)
  .where(images_tbl.c.id == bindparam("id_"))
  .values({"value1": bindparam("value1")})
)

# conn is an sqlalchemy connection instance
conn.execute(upd_stmt, update_mappings)
```


## Query by relationship using ORM

```python
items = (
  self.db_session.query(Profile)
  .options(joinedload(Profile.profile_metadata))
  .filter(
    and_(
      Profile.profile_metadata.mapper.class_.local_path.isnot(None),
      or_(Profile.error.is_(None), Profile.error == ''),
      Profile.profile_metadata.mapper.class_.pushed_to_storage == '0',
      Profile.created_at <= create_date.strftime('%Y-%m-%d %H:%m:00')
    )
  )
  .order_by(Profile.created_at.asc())
  .limit(self.BATCH_SIZE)
  .all()
)
```
