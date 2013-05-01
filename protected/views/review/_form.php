<?php
/* @var $form CActiveForm */

?>

<div class="form">

<?php $form=InfonesiaController::beginWidget('CActiveForm', array(
	'id'=>'review-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>


	<div class="row">
		<?php echo $form->labelEx($model,'isi'); ?>
		<?php echo $form->textArea($model,'isi',array('rows'=>6, 'cols'=>100,)); ?>
		<?php echo $form->error($model,'isi'); ?>
	</div>


	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'save' : 'newReview($infonesia)'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->