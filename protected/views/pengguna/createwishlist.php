<?php
/* @var $this PenggunaController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Wishlist',
);
?>

<h1>Wishlist</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_createwishlist',
));

echo CHtml::button('Create wishlist', array('submit'=>array('pengguna/viewWishlist')));

?>
