<?php
/* @var $this WishlistController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Daftar Wishlist',
);
?>

<h1>Daftar Wishlist</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
