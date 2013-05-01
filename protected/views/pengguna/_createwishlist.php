<?php
/* @var $this PenggunaController */

?>

<div class="view">

	
	<?php echo CHtml::encode($data->namadaerah); ?>
        <br />
        <img src="<?php echo Yii::app()->request->baseUrl.'/images/'.$data->namadaerah.'/'.$data->namadaerah0->urlpics[0]->urlpic?>" width="250" height="150"/>
	<br />
        <div class="button">
            <?php echo CHtml::checkBox('selectedItems', false, array('value'=>$data->id)) ?>
        </div>

</div>