
<?php
/*function fibV2($n){
	static $result = array();
	if (!isset($result[$n])) {
		if ($n <= 2) {
			$result[$n] = 1;
            echo 'inside1<br/>';
		} else {
			$result[$n] = fibV2($n - 2) + fibV2($n - 1);
			echo 'inside2<br/>';
		}
	}
	return $result[$n];
}*/



function fibV1($n)
{
    if ($n <= 2) {
        echo 'inside1<br/>';
        return 1;
    } else {
        echo 'inside2<br/>';
        return fibV1($n - 2) + fibV1($n - 1);
    }
}

echo fibV1(20);