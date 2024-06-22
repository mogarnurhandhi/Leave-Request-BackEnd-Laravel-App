<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\VerifikatorController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth:api');

Route::get('admin/users', [AdminController::class, 'getAllUser']);
Route::post('admin/add-ordinary-user', [AdminController::class, 'addOrdinaryUser']);
Route::post('admin/add-verifikator', [AdminController::class, 'addVerifikator']);
Route::put('admin/users/{id}/role', [AdminController::class, 'updateRoleOUToVerifikator']);
Route::get('admin/izin', [AdminController::class, 'viewAllIzin']);
Route::put('admin/users/{id}/reset-password', [AdminController::class, 'resetPasswordOrdinaryUser']);

Route::put('verifikator/users/{id}/verify', [VerifikatorController::class, 'verifyOrdinaryUser']);
Route::put('verifikator/acc-izin/{id}', [VerifikatorController::class, 'accIzin']);
Route::put('verifikator/reject-izin/{id}', [VerifikatorController::class, 'rejectIzin']);

Route::post('user/pengajuan-izin', [UserController::class, 'pengajuanIzin']);
Route::get('user/{id}/lihat-izin', [UserController::class, 'lihatIzin']);
Route::patch('user/{id}/update-izin', [UserController::class, 'updateIzin']);
Route::get('user/{id}/status-izin', [UserController::class, 'lihatStatusIzin']);
Route::patch('user/{id}/batalkan-izin', [UserController::class, 'batalkanIzin']);
Route::delete('user/{id}/hapus-izin', [UserController::class, 'hapusIzin']);
Route::put('user/{id}/update-password', [UserController::class, 'updatePassword']);
