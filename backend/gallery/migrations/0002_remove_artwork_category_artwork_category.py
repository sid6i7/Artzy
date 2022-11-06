# Generated by Django 4.1.2 on 2022-10-28 22:56

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('gallery', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='artwork',
            name='category',
        ),
        migrations.AddField(
            model_name='artwork',
            name='category',
            field=models.ForeignKey(default='22', on_delete=django.db.models.deletion.CASCADE, to='gallery.category'),
            preserve_default=False,
        ),
    ]