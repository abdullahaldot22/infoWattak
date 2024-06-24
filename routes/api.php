<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\TestController;
use App\Http\Controllers\Api\AuthController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/test', [TestController::class, 'index']);

Route::controller(AuthController::class)->group(function () {
    Route::post('/register', 'register');
    Route::post('/login', 'login');
    Route::get('/logout', 'logout')->middleware('auth:sanctum');
});

Route::middleware('auth:sanctum')->controller(ProductController::class)->group(function () {
    Route::get('/products', 'index');
    Route::post('/product', 'store');
    Route::get('/product/{id}', 'show');
    Route::post('/product/update', 'update');
    Route::delete('/product/{id}', 'delete');
    Route::get('/products/deleted', 'deleted');
    Route::get('/product/{id}/restore', 'restore');
    Route::get('/product/{id}/destroy', 'destroy');

});
