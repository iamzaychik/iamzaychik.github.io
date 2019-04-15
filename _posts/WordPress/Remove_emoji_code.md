---
title: Remove emoji code
categories: WordPress
date: 2019-04-15
---

_Заводи стоять, а вони емодзі постять.
Повбивав би._

-----

У файлі `/wp-content/themes/"your_theme"/functions.php` дописуємо:
`// REMOVE WP EMOJI
remove_action('wp_head', 'print_emoji_detection_script', 7);
remove_action('wp_print_styles', 'print_emoji_styles');
remove_action( 'admin_print_scripts', 'print_emoji_detection_script' );
remove_action( 'admin_print_styles', 'print_emoji_styles' );`

-----
* <a href="http://www.denisbouquet.com/remove-wordpress-emoji-code/" target="_blank">Пишуть люди</a>
-----