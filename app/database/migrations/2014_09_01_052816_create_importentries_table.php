<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateImportentriesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('importentries', function(Blueprint $table)
		{
			$table->increments('id');
			$table->timestamps();
            $table->string('class',200);
            $table->integer('importmap_id')->unsigned();
            $table->integer('old')->unsigned();
            $table->integer('new')->unsigned();

            // map import entries to import map.
            // connect accounts to account_types
            $table->foreign('importmap_id')
                  ->references('id')->on('importmaps')
                  ->onDelete('cascade');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('importentries');
	}

}