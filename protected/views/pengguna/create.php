<?php
/* @var $this PenggunaController */
/* @var $model Pengguna */

// $this->breadcrumbs=array(
// 	'Penggunas'=>array('index'),
// 	'Create',
// );

// $this->menu=array(
// 	array('label'=>'List Pengguna', 'url'=>array('index')),
// 	array('label'=>'Manage Pengguna', 'url'=>array('admin')),
// );
?>

<h1>Formulir Pendaftaran</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model, 'pt'=>$pt, 'profil'=>$profil)); ?>
