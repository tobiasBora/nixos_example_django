{ stdenv, lib, python3, python36Packages, makeWrapper }:
let
  djangoEnv = python3.withPackages (ps: with ps; [
    gunicorn django ]);
in
stdenv.mkDerivation rec  {
  version = "1.0";
  name = "mydjangowebsite-${version}";
  src = ./src;
  nativeBuildInputs = with python36Packages; [ django makeWrapper ];
  buildInputs = with python36Packages; [ django gunicorn ];
  installPhase = ''
    mkdir -p $out/bin/
    mkdir -p $out/www/
    cp -av ${src}/* $out/www/
    makeWrapper ${djangoEnv}/bin/gunicorn $out/bin/gunicorn_normal --add-flags --pythonpath --add-flags $out/www --add-flags mydjangowebsite.wsgi:application
  '';
  meta = {
    description = "Deploy a demo website";
  };
}


#     systemd.services.acfunk = let
#       djangoEnv = let
#         bootstrap4 = pkgs.python3.pkgs.buildPythonPackage rec {
#           pname = "django-bootstrap4";
#           version = "0.0.7";
  
#           src = pkgs.python3.pkgs.fetchPypi {
#             inherit pname version;
#             sha256 = "32ffee49c4c8ca7df543aac8733a5d45ad304078f920a0167819525bd33a955a";
#           };
  
#           doCheck = false;
#         };
#         orderedModel = pkgs.python3.pkgs.buildPythonPackage rec {
#           pname = "django-ordered-model";
#           version = "3.1.1";

#           src = pkgs.python3.pkgs.fetchPypi {
#             inherit pname version;
#             sha256 = "14aeacca5a4d41de92b89432a7665b6be5ef254e72418cbeb32258348ad05352";
#           };

#           doCheck = false;
#         };
#         imagekit = pkgs.python3.pkgs.buildPythonPackage rec {
#           pname = "django-imagekit";
#           version = "4.0.2";
  
#           src = pkgs.python3.pkgs.fetchPypi {
#             inherit pname version;
#             sha256 = "0370rqi0x2mafxckrrbczpni3lahyc7c3hlz7i2wslnzgjvszh3f";
#           };
          
#           doCheck = false;

#           propagatedBuildInputs = [ pkgs.python3.pkgs.pilkit pkgs.python3.pkgs.six pkgs.python3.pkgs.django_appconf ];
#         };
#       in
#         (pkgs.python3.withPackages (ps: with ps; [ gunicorn django_2_1 pillow whitenoise brotlipy bootstrap4 imagekit psycopg2 orderedModel ]));
#     in {
#       description = "Anne-Christine Funk virtual art gallery";
#       after = [ "network.target" ];
#       wantedBy = [ "multi-user.target" ];
#       preStart = ''
#         ${djangoEnv}/bin/python manage.py migrate;
#         ${djangoEnv}/bin/python manage.py collectstatic --no-input;
#       '';
#       serviceConfig = {
#         WorkingDirectory = "/var/www/acfunk/";
#         ExecStart = ''${djangoEnv}/bin/gunicorn \
#           --access-logfile \
#           - --workers 3 \
#           --bind unix:/var/www/acfunk/acfunk.sock \
#           acfunk.wsgi:application
#         '';
#         Restart = "always";
#         RestartSec = "10s";
#         StartLimitInterval = "1min";
#         User = "jenkins";
#       };
#     };

#     services.nginx.virtualHosts = {  
#       "annechristinefunk.com" = {
#         enableACME = true;
#         forceSSL = true;
#         locations = {
#           "/" = {
#             proxyPass = "http://unix:/var/www/acfunk/acfunk.sock";
#           };
#           "/media/" = {
            
#             root = "/var/www/acfunk";
#             extraConfig = ''
#               expires 365d;
#               add_header Cache-Control "public, immutable";
#             '';
#           };
#         };
#       };
#       "www.annechristinefunk.com" = {
#         enableACME = true;
#         forceSSL = true;
#         globalRedirect = "annechristinefunk.com";
#       };
# };
