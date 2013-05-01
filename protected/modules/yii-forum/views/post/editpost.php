<?php
    $this->widget('zii.widgets.CBreadcrumbs', array(
        'links'=>array_merge(
            $model->thread->getBreadcrumbs(true),
            array('Edit post')
        ),
    ));
?>

<div class="form" style="margin:20px;">
    <?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm', array(
        'id'=>'post-form',
        'enableClientValidation'=>true,
        'clientOptions'=>array(
            'validateOnSubmit'=>true,
	),
    )); ?>

        <div class="row">
           <!--  <?php echo $form->labelEx($model,'content'); ?>
            <?php echo $form->textArea($model,'content', array('rows'=>10, 'cols'=>70)); ?>
            --> 
            <?php echo $form->markdownEditorRow($model, 'content', array('height'=>'200px'));?>
            <?php echo $form->error($model,'content'); ?>
        </div>

       <!--  <div class="row buttons">
            <?php echo CHtml::submitButton('Submit'); ?> -->
        <div class="form-actions">
            <?php $this->widget('bootstrap.widgets.TbButton', array (
                                                                'buttonType'=>'submit',
                                                                'type'=>'primary',
                                                                'label'=> 'Submit',
            )); ?>    
        </div>
    <?php $this->endWidget(); ?>
</div><!-- form -->
