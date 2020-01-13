# Python snippets

## Human-readable representation of numbers

```python
def human_readable(val):
    """
    Return a human-readable representation of numbers like 1200 -> 1.2k and 1400000 -> 1.4M
    :param val:
    :return:
    """
    for num, prefix in [
        (1000000, "M"),
        (1000, "k"),
    ]:
        if val / num >= 1:
            val = round(val / num, 2)
            if val % 1 == 0:
                val = int(val)
            return "{}{}".format(val, prefix)

    return val
```

## Chunk

Split into N chunks

```python
def chunks(lst, n):
    """Return list of n successive chunks from lst."""
    import math
    chunk_size = math.ceil(len(lst) / n)
    res = []
    for i in range(0, len(lst), chunk_size):
        res.append(lst[i:i + chunk_size])
    return res
```

Split into N-sized chunks

```python
def chunks(lst, n):
    """Yield successive n-sized chunks from lst."""
    for i in range(0, len(lst), n):
        yield lst[i:i + n]

def chunks(lst, n):
    """Return list of successive n-sized chunks from lst."""
    res = []
    for i in range(0, len(lst), n):
        res.append(lst[i:i + n])
    return res
```
