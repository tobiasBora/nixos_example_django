#!/usr/bin/env python

from setuptools import find_packages, setup

setup(name='mydjangowebsite',
      version='1.0',
      description='My django website with nixos',
      author='Me',
      author_email='me@example.com',
      packages=find_packages(),
      #scripts=["manage.py"],
      include_package_data=True,
     )
