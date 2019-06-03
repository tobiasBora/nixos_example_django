{ lib, python36Packages }:
# build file (derivation), buildPythonPackage does all the magic for us

python36Packages.buildPythonPackage rec {

  name = "mydjangowebsite-${version}";
  version = "1.0";
  propagatedBuildInputs = with python36Packages; [ django setuptools ];

  src = ./src;
  doCheck = false;

  meta = {
    description = "Deploy a demo website";
    maintainers = with lib.maintainers; [ ];
  };

}
