<?php
        

        $dataProvider = new CActiveDataProvider('Wishlist',array(
            'pagination'=>array('pageSize'=>5),
            'criteria'=>array('condition'=> 'username=\''.$model->username.'\''),

));
?>
<!-- 
<?php $this->widget('zii.widgets.CListView', array(
       'dataProvider'=>$dataProvider,
       'itemView'=>'wishlistView',
       'pager'=>array('header'=>'Pages'),
       
       
)); 
?>
 -->
 <h2> Wishlist </h2>
<?php $this->widget('bootstrap.widgets.TbThumbnails', array(
		'dataProvider'=>$dataProvider,
       	'itemView'=>'wishlistView',
       	// 'template'=>"{items}\n{pager}",
       // 'pager'=>array('header'=>'Pages'),
	));
?>