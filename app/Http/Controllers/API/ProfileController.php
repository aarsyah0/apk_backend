<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class ProfileController extends Controller
{
    public function getProfile(Request $request)
    {
        return response()->json($request->user());
    }
    public function updateProfile(Request $request)
    {
        $user = $request->user();

        $request->validate([
            'name' => 'required|string',
            'email' => 'required|email',
            'photo' => 'nullable|image|max:1024',
        ]);

        $user->name = $request->name;
        $user->email = $request->email;
        if ($request->hasFile('photo')) {
            $path = $request->file('photo')->store('profile_photos');
            $user->photo_url = $path;
        }

        $user->save();

        return response()->json($user);
    }
}
