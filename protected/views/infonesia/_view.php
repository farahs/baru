<?php
/* @var $this InfonesiaController */
/* @var $data Infonesia */
?>

<div class="view">

	<img src="<?php echo Yii::app()->request->baseUrl.'/images/infonesia/'.$data->namadaerah.'/'.$data->urlpics[0]->urlpic?>" width="200" height="100"/>
	<br/>
	<b><?php echo CHtml::encode($data->getAttributeLabel('namadaerah')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->namadaerah), array('view', 'id'=>$data->namadaerah)); ?>
	<br />
	

	<b><?php echo CHtml::encode($data->getAttributeLabel('kendaraan')); ?>:</b>
	<?php echo CHtml::encode($data->kendaraan); ?>
	<br />


</div>