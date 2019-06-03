# Does not compile

Running:

    nix-build

and then

    result/bin/manage.py
    
works. But running:

    result/bin/manage.py runserver
    
fails with the error:

```
  File "/nix/store/d7pny20rsfpxwkwqlijcj4aw1b4jzc4n-python3.6-mydjangowebsite-1.1/bin/manage.py", line 2
    export PATH='/nix/store/y2jqsq63bhf3rz51hrg8pb78fjgwzwvv-python3-3.6.8/bin:/nix/store/d7pny20rsfpxwkwqlijcj4aw1b4jzc4n-python3.6-mydjangowebsite-1.1/bin:/nix/store/345p44wgp556fygvyxmay65jygbmh2nk-python3.6-Django-1.11.18/bin:/nix/store/158j5bzslaxhgq4s93ljslgd4b3y6kjb-python3.6-setuptools-40.6.3/bin'${PATH:+':'}$PATH
              ^
SyntaxError: invalid syntax
```


Why?!


Note that some other commands actually work, like:

    result/bin/manage.py shell

