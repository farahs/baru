<?php
        

        $dataProvider = new CActiveDataProvider('Foto',array(
            'pagination'=>array('pageSize'=>5),
            'criteria'=>array('condition'=> 'username=\''.$model->username.'\''),

));
?>
<!-- 
<?php $this->widget('zii.widgets.CListView', array(
       'dataProvider'=>$dataProvider,
       'itemView'=>'galleryView',
       'pager'=>array('header'=>'Pages'),
       
       
)); 
?> -->
<h2> Gallery </h2>
<?php $this->widget('bootstrap.widgets.TbThumbnails', array(
		'dataProvider'=>$dataProvider,
       	'itemView'=>'galleryView',
       	// 'template'=>"{items}\n{pager}",
       // 'pager'=>array('header'=>'Pages'),
	));
?>
