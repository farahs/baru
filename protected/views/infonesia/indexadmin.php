<?php
/* @var $this InfonesiaController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Infonesia',
);

$this->menu=array(
	array('label'=>'Create Infonesia', 'url'=>array('create')),
);
?>

<h1>Daftar Infonesia</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
