<?php
// For admins, add link to delete post
$isAdmin = !Yii::app()->user->isGuest && Yii::app()->user->isAdmin();
?>
<div class="post">
    <div class="header">
        <?php echo Yii::app()->controller->module->format_date($data->created, 'long'); ?> by <?php echo CHtml::link(CHtml::encode($data->authorUsername), array('/pengguna/view', 'id'=>$data->authorUsername)); ?>
        <!-- CHtml::link(CHtml::encode($author), array('/pengguna/view', 'id'=>$author)); -->
        <?php if($data->editor) echo ' (Modified: '. Yii::app()->controller->module->format_date($data->updated, 'long') .' by '. CHtml::link(CHtml::encode($data->editorUsername), array('pengguna/view', 'id'=>$data->editorUsername)) .')'; ?>

<!--         <?php
            if($isAdmin)
            {
                $deleteConfirm = "Are you sure? This post will be permanently deleted!";
                echo '<div class="admin" style="float:right; border:none;">'.
                        CHtml::ajaxLink('Delete post',
                            array('/forum/post/delete', 'id'=>$data->id),
                            array('type'=>'POST', 'success'=>'function(){document.location.reload(true);}'),
                            array('confirm'=>$deleteConfirm, 'id'=>'post'.$data->id)
                        ).
                     '</div>';
            }
        ?> -->
    </div>
    <div class="content">
        <?php
            $this->beginWidget('CMarkdown', array('purifyOutput'=>true));
                echo $data->content;
            $this->endWidget();

            if($data->author->signature)
            {
                echo '<br />---<br />';
                $this->beginWidget('CMarkdown', array('purifyOutput'=>true));
                    echo $data->author->signature;
                $this->endWidget();
            }
        ?>
    </div>
    <?php if($isAdmin || Yii::app()->user->id == $data->authorUsername): ?>
        <div class="footer">
            <?php echo CHtml::link(CHtml::image(Yii::app()->controller->module->registerImage("postbit_edit.gif")), array('/forum/post/update', 'id'=>$data->id)); ?>
            <?php 
                $deleteConfirm = "Are you sure? This post will be permanently deleted!";
                echo '<div class="admin" style="float:right; border:none;">'.
                        CHtml::ajaxLink('Delete post',
                            array('/forum/post/delete', 'id'=>$data->id),
                            array('type'=>'POST', 'success'=>'function(){document.location.reload(true);}'),
                            array('confirm'=>$deleteConfirm, 'id'=>'post'.$data->id)
                        ).
                     '</div>';
            ?>        
        </div>
    <?php endif; ?>
</div>
