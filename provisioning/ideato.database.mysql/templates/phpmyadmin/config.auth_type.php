<?php

//avoid login screen in phpmyadmin and auto login
$cfg['Servers'][$i]['auth_type']    = 'config';
$cfg['Servers'][$i]['user']         = '{{ ideato_mysql_user }}';
$cfg['Servers'][$i]['password']     = '{{ ideato_mysql_password }}';
