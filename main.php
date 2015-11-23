#!/usr/bin/env php
<?php

function factorial($n)
{
	$res = 1;
	for ($i = 1; $i <= $n; $i++)
	{
		$res *= $i;
	}
	return $res;
}

function calc($n)
{
	$res = 0;
	for ($i = 0; $i <= $n; $i++)
	{
		$res += (1 / factorial($i));
	}
	return $res;
}


$limit = 100;

if ($argc > 1)
{
	$limit = $argv[1];
}

echo number_format(calc($limit), 16);
echo "\n";

?>
