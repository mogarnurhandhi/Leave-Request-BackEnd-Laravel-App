<?php

namespace App\Http\Controllers;

use App\Models\Izin;
use App\Models\Role;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AdminController extends Controller
{
    public function getAllUser()
    {
        $users = User::all();
        return response()->json($users, 200);
    }

    public function addOrdinaryUser(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
            //'role_id' => 'required|exists:roles,id',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'role_id' => 3,
            'status' => 'pending',
        ]);

        return response()->json([
            'message' => 'ordinary user added successfully',
        ], 200);
    }

    public function addVerifikator(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
            //'role_id' => 'required|exists:roles,id',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $users = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'role_id' => 2,
            'status' => 'verified',
        ]);

        return response()->json([
            'message' => 'verivikator add successfully'
        ], 200);
    }


    public function updateRoleOUToVerifikator(Request $request, $id)
    {
        $user = User::findOrFail($id);
        $user->role_id = 2;
        $user->status = 'verified';
        $user->save();

        return response()->json([
            'message' => 'change role to verifikator successfully'
        ], 200);
    }

    public function viewAllIzin()
    {
        $izins = Izin::all();
        return response()->json($izins, 200);
    }

    public function resetPasswordOrdinaryUser(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'password' => 'required|string|min:8',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $user = User::findOrFail($id);
        $user->password = Hash::make($request->password);
        $user->save();

        return response()->json([
            'message' => 'password reset successfully'
        ], 200);
    }
}
