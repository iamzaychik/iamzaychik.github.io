---
title: Export posts to txt
category: WordPress
date: 2019-04-22
---

-----

```php
#!/usr/local/bin/php

<?php

require_once('wp-load.php');

$args = array(
    'post_type' => 'post',
    'post_status' => 'publish',
    'posts_per_page' => -1 # Set to post ID for one export
);

$query = new WP_Query($args);
while ( $query->have_posts() ) : $query->the_post();
    $f = fopen("posts/".get_the_title() . '.txt', 'w'); # Path to exported files
    $content = 'Title: ' . get_the_title() . PHP_EOL;
    $content .= 'Pub date: ' . get_the_date() . PHP_EOL;
    $content .= 'Category: ';
    foreach (get_the_category() as $cat) {
        $content .= $cat->cat_name . ', ';
    }       
    $content .= PHP_EOL . PHP_EOL;
    $content .= get_the_content();

    fwrite($f, $content);
    fclose($f);
endwhile;

?>
```

-----

[Source](https://wordpress.stackexchange.com/a/61640)

-----