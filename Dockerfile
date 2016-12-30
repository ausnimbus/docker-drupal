FROM centos/php-70-centos7

MAINTAINER AusNimbus <support@ausnimbus.com.au>

LABEL io.k8s.description="Drupal quickstart deployment. S2I and scaling to more than one replica is not supported." \
      io.k8s.display-name="Drupal with Apache 2.4 and PHP 7.0" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="drupal,php" \
      io.openshift.non-scalable=true

RUN mkdir /opt/app-root/src/drupal \
      && fix-permissions /opt/app-root/src/drupal

COPY s2i/bin/* $STI_SCRIPTS_PATH/

USER 1001
VOLUME /opt/app-root/src/drupal
CMD $STI_SCRIPTS_PATH/assemble
