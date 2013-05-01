<?php
/* @var $this InfonesiaController */

$this->breadcrumbs=array(
	'Infonesia'=>array('index'),
	$model->namadaerah,
);

?>

<h1><?php echo $model->namadaerah; ?></h1>

<?php 
    
    $this->widget('bootstrap.widgets.TbCarousel', array(
    'items'=>array(
        array(
            'image'=>Yii::app()->request->baseUrl.'/images/infonesia/'.$model->namadaerah.'/'.$urlpic[0]->urlpic,),
            // 'label'=>'First Thumbnail label',
            // 'caption'=>'Cras justo odio, dapibus ac facilisis in, egestas eget quam. ' .
            // 'Donec id elit non mi porta gravida at eget metus. ' .
            // 'Nullam id dolor id nibh ultricies vehicula ut id elit.'),
        array(
            'image'=>Yii::app()->request->baseUrl.'/images/infonesia/'.$model->namadaerah.'/'.$urlpic[1]->urlpic,),
            // 'label'=>'Second Thumbnail label',
            // 'caption'=>'Cras justo odio, dapibus ac facilisis in, egestas eget quam. ' .
            // 'Donec id elit non mi porta gravida at eget metus. ' .
            // 'Nullam id dolor id nibh ultricies vehicula ut id elit.'),
        array(
            'image'=>Yii::app()->request->baseUrl.'/images/infonesia/'.$model->namadaerah.'/'.$urlpic[2]->urlpic,),
            // 'label'=>'Third Thumbnail label',
            // 'caption'=>'Cras justo odio, dapibus ac facilisis in, egestas eget quam. ' .
            // 'Donec id elit non mi porta gravida at eget metus. ' .
            // 'Nullam id dolor id nibh ultricies vehicula ut id elit.'),
        array(
            'image'=>Yii::app()->request->baseUrl.'/images/infonesia/'.$model->namadaerah.'/'.$urlpic[3]->urlpic,),
            // 'label'=>'Third Thumbnail label',
            // 'caption'=>'Cras justo odio, dapibus ac facilisis in, egestas eget quam. ' .
            // 'Donec id elit non mi porta gravida at eget metus. ' .
            // 'Nullam id dolor id nibh ultricies vehicula ut id elit.'),
        array(
            'image'=>Yii::app()->request->baseUrl.'/images/infonesia/'.$model->namadaerah.'/'.$urlpic[4]->urlpic,),
            // 'label'=>'Third Thumbnail label',
            // 'caption'=>'Cras justo odio, dapibus ac facilisis in, egestas eget quam. ' .
            // 'Donec id elit non mi porta gravida at eget metus. ' .
            // 'Nullam id dolor id nibh ultricies vehicula ut id elit.'),
        ),
    ));?>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'namadaerah',
		'deskripsi',
		'kendaraan',
	),
)); ?>

<h3>Restoran</h3>
    <?php $this->renderPartial('_tempatmakan',array(
             'data'=>$model->tempatmakans,
             'dataProvider'=>$tempatmakan,
        ));
    ?>
<h3>Penginapan</h3>
    <?php $this->renderPartial('_penginapan',array(
             'data'=>$model->penginapans,
             'dataProvider'=>$penginapan,
        ));
    ?>

<?php

    echo CHtml::button('Add to wishlist', array('submit'=>array('infonesia/container','namadaerah'=>$model->namadaerah)));

?>
<?php if(Yii::app()->user->hasFlash('wishlistSubmitted')); ?>
<div class="wishlist-success">
     <?php echo Yii::app()->user->getFlash('wishlistSubmitted'); ?>
</div>

<div class="rating">
    <?php
        $this->widget('CStarRating',array(
            'name'=>'rating',
            'maxRating' => 5,
            'minRating' => 1,
            'allowEmpty' => false,
            'readOnly' => false,

            'callback'=>'
            function(){
                    $.ajax({
                    type: "POST",
                    url: "'.Yii::app()->createUrl('infonesia/rating').'",
                    data: "id='.$model->namadaerah.'&rate=" + $(this).val(),
                    success: function(msg){
                    $("#rating > input").rating("readOnly", true);
                    }})}'
             ));
        
    ?>
    <?php echo $rating."/5";?>
</div>


<div id="comments">
    <h3>Leave a Comment</h3>

    <?php if(Yii::app()->user->hasFlash('commentSubmitted')): ?>

        <div class="flash-success">
            <?php echo Yii::app()->user->getFlash('commentSubmitted'); ?>
        </div>

    <?php else: ?>
        <?php $this->renderPartial('/review/_form',array(
            'infonesia'=>$model,
            'model'=>$review,
        )); ?>
    
    <?php endif; ?>

    <?php $this->renderPartial('_review',array(
            'data'=>$review,
            'model'=>$model
        ));
    ?>
</div>



