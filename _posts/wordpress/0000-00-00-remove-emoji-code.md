---
title: Remove emoji code
category: WordPress
date: 2019-04-15
---

-----

* Insert into `/wp-content/themes/<YOUR THEME>/functions.php`:
```php
// REMOVE WP EMOJI
remove_action('wp_head', 'print_emoji_detection_script', 7);
remove_action('wp_print_styles', 'print_emoji_styles');
remove_action( 'admin_print_scripts', 'print_emoji_detection_script' );
remove_action( 'admin_print_styles', 'print_emoji_styles' );`
```

-----

* [Source](http://www.denisbouquet.com/remove-wordpress-emoji-code)

-----