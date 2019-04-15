---
title: jQuery
category: WordPress
date: 2019-04-15
---

_Підключаємо цей кінський jQuery для сумісності версій.
Пишіть человєчєські тєми, упиряки, бо накол всіх сікундою!_

-----

У файлі `/wp-content/themes/"your_theme"/functions.php` дописуємо:
`function my_jquery_scripts() {
wp_deregister_script( 'jquery' );
wp_register_script( 'jquery', 'https://code.jquery.com/jquery-2.2.0.min.js');
wp_enqueue_script( 'jquery' );
}
add_action( 'wp_enqueue_scripts', 'my_jquery_scripts' );`

-----

