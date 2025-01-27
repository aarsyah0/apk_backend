<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Todo extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'title',
        'description',
        'user_id',
        'is_completed',
    ];

    /**
     * Relasi dengan model User.
     * Setiap todo dimiliki oleh satu user.
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
