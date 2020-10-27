<?php

use Anax\TextFilter\TextFilter;

/**
 * Read all ctf files in src/{id} and insert into database.
 */
error_reporting(-1);              // Report all type of errors
ini_set("display_errors", 1);     // Display all errors

require __DIR__ . "/../vendor/autoload.php";



// Prepare the database
$dsn = "sqlite:" . __DIR__ . "/../data/ctf.sqlite";
$db = new PDO($dsn);

$sql = "INSERT INTO ctf VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
$sqlInsert = $db->prepare($sql);

$sql = "INSERT INTO ctf2tag VALUES (?, ?);";
$sqlTag = $db->prepare($sql);

$sql = "INSERT INTO hint VALUES (?, ?, ?, ?);";
$sqlHint = $db->prepare($sql);

// Utilties to read ctf data
$textfilter = new TextFilter();
$textfilter->setFilterConfig("frontmatter", [
    "include" => false,
    "frontmatter_yaml" => true,
]);



// For each ctf, add it to the database
foreach (glob(__DIR__ . "/../src/*", GLOB_ONLYDIR) as $dir) {
    // Get the id
    $id = basename($dir);

    // Get the content of README including meta
    $file = "$dir/README.md";
    $markdown = file_get_contents($file);
    $parsed = $textfilter->parse($markdown, ["frontmatter", "markdown", "titlefromheader"]);
    $author = $parsed->frontmatter["author"] ?? "no-author";
    $updated = $parsed->frontmatter["updated"] ?? "unknown";
    $title = $parsed->frontmatter["title"] ?? "no-title";
    $level = $parsed->frontmatter["level"] ?? "no-level";
    $target = $parsed->frontmatter["target"] ?? "missing";
    $tts = $parsed->frontmatter["tts"] ?? 0;
    $tag = $parsed->frontmatter["tag"] ?? [];
    $text = $parsed->text ?? "no text";
    //var_dump($parsed);

    // Get the flag
    $flag = file_get_contents("$dir/flag.txt");

    // Echo a summary
    echo "$id $author '$title' [" . implode(",", $tag) . "]\n";

    // Execute the queries
    $sqlInsert->execute([$id, $title, $text, $author, $updated, $level, $target, $tts, $flag]);

    // Set the tags
    foreach ($tag as $tagLabel) {
        $sqlTag->execute([$id, $tagLabel]);
    }

    // Get/set the hints
    foreach (glob("$dir/hint/?.md") as $hint) {
        $markdown = file_get_contents($hint);
        $parsed = $textfilter->parse($markdown, ["frontmatter", "markdown", "titlefromheader"]);
        $title = $parsed->frontmatter["title"] ?? "no-title";
        $text = $parsed->text ?? "no text";
        $hintId = basename($hint, ".md");
        $sqlHint->execute([$hintId, $id, $title, $text]);
    }

    // //var_dump($stm->errorInfo());
}
