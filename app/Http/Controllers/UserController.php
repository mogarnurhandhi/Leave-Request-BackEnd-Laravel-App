<?php

namespace App\Http\Controllers;

use App\Models\Izin;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function pengajuanIzin(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:users,id',
            'judul' => 'required|string|max:255',
            'isi' => 'required|string',
            'detail' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $izin = Izin::create([
            'user_id' => $request->user_id,
            'judul' => $request->judul,
            'isi' => $request->isi,
            'detail' => $request->detail,
            'status' => 'pending',
        ]);

        return response()->json([
            'message' => 'izin submitted successfully'
        ], 200);
    }

    public function lihatIzin($id)
    {
        $izin = Izin::where('user_id', $id)->get();
        return response()->json($izin, 200);
    }

    public function updateIzin(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:users,id',
            'judul' => 'required|string',
            'isi' => 'required|string',
            'detail' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $izin = Izin::findOrFail($id);
        $izin->user_id = $request->user_id;
        $izin->judul = $request->judul;
        $izin->isi = $request->isi;
        $izin->detail = $request->detail;
        $izin->save();

        return response()->json([
            'message' => 'izin update successfully'
        ], 200);
    }

    public function lihatStatusIzin($id)
    {
        $izin = Izin::where('id', $id)->get();
        return response()->json($izin, 200);
    }

    public function batalkanIzin($id)
    {
        $izin = Izin::where('id', $id)->where('status', 'pending')->first();
        if (!$izin) {
            return response()->json([
                'error' => 'not found'
            ], 404);
        }

        $izin->status = 'canceled';
        $izin->save();

        return response()->json([
            'message' => 'Izin berhasil dibatalkan'
        ], 200);
    }

    public function hapusIzin($id)
    {
        $izin = Izin::where('id', $id)->where('status', 'pending')->first();
        if (!$izin) {
            return response()->json([
                'error' => 'not found'
            ], 404);
        }

        $izin->delete();

        return response()->json([
            'messsage' => 'Izin deleted successfully'
        ], 200);
    }

    public function updatePassword(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'password' => 'required|string|min:8'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $user = User::findOrFail($id);
        $user->password = Hash::make($request->password);
        $user->save();

        return response()->json([
            'message' => 'password updated successfully'
        ], 200);
    }
}
