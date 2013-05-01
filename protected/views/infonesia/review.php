<?php
/* @var $this ReviewController */
/* @var $data Review */
?>

<div class="view">

        <table>
            <tr>
                <td>
                    <div class="img-with-text">
                    <?php $img = '/images/'.$data->username0->profils->avatar ;?>
                    <img src="<?php echo Yii::app()->baseUrl;?>/images/avatar/<?php echo $data->username0->profils->avatar;?>" width="64" height="64" />
                    <a href ="#"><?php echo CHtml::link($data->username0->username, array('/pengguna/view','id'=>$data->username0->username)); ?></a>
                    </div>
                </td>
                <td><?php echo CHtml::encode($data->isi); ?> </td>
            </tr>
        </table>
</div>