<?php
/* @var $this PenggunaController */
/* @var $model Pengguna */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'pengguna-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($profil,'avatar'); ?>
		<?php echo $form->textField($profil,'avatar',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($profil,'avatar'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($profil,'nama'); ?>
		<?php echo $form->textField($profil,'nama',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($profil,'nama'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($profil,'contact'); ?>
		<?php echo $form->textField($profil,'contact',array('size'=>15,'maxlength'=>15)); ?>
		<?php echo $form->error($profil,'contact'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($profil,'sex'); ?>
		<div class="compactRadioGroup">
			<?php echo $form->radioButtonList($profil,'sex',array('Male'=>'Male', 'Female'=>'Female'),array('separator'=>' ')); ?>
		</div>
		<?php echo $form->error($profil,'sex'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Daftar' : 'Save'); ?>
		<?php echo CHtml::Button('Cancel',array('onClick'=> 'js:history.go(-1);returnFalse;')); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->