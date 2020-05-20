import "babylon.dart";

extension Operators_Matrix on Matrix {
    double operator [](int index) => this.asArray()[index];
    Matrix operator +(Matrix other) => this.add(other);
    Matrix operator *(Matrix other) => this.multiply(other);
}

extension Operators_Vector2 on Vector2 {
    Vector2 operator +(dynamic other) {
        if (other is num) {
            return new Vector2(this.x + other, this.y + other);
        } else if (other is Vector2) {
            return this.add(other);
        }
        throw(ArgumentError("Invalid Vector2 addition: $this + $other"));
    }
    Vector2 operator -(dynamic other) {
        if (other is num) {
            return new Vector2(this.x - other, this.y - other);
        } else if (other is Vector2) {
            return this.subtract(other);
        }
        throw(ArgumentError("Invalid Vector2 subtraction: $this - $other"));
    }
    Vector2 operator *(dynamic other) {
        if (other is num) {
            return this.scale(other);
        } else if (other is Vector2) {
            return this.multiply(other);
        }
        throw(ArgumentError("Invalid Vector2 multiplication: $this * $other"));
    }
    Vector2 operator /(dynamic other) {
        if (other is num) {
            return this.scale(1.0/other);
        } else if (other is Vector2) {
            return this.divide(other);
        }
        throw(ArgumentError("Invalid Vector2 division: $this / $other"));
    }
}

extension Operators_Vector3 on Vector3 {
    Vector3 operator +(dynamic other) {
        if (other is num) {
            return new Vector3(this.x + other, this.y + other, this.z + other);
        } else if (other is Vector3) {
            return this.add(other);
        }
        throw(ArgumentError("Invalid Vector3 addition: $this + $other"));
    }
    Vector3 operator -(dynamic other) {
        if (other is num) {
            return new Vector3(this.x - other, this.y - other, this.z - other);
        } else if (other is Vector3) {
            return this.subtract(other);
        }
        throw(ArgumentError("Invalid Vector3 subtraction: $this - $other"));
    }
    Vector3 operator *(dynamic other) {
        if (other is num) {
            return this.scale(other);
        } else if (other is Vector3) {
            return this.multiply(other);
        }
        throw(ArgumentError("Invalid Vector3 multiplication: $this * $other"));
    }
    Vector3 operator /(dynamic other) {
        if (other is num) {
            return this.scale(1.0/other);
        } else if (other is Vector3) {
            return this.divide(other);
        }
        throw(ArgumentError("Invalid Vector3 division: $this / $other"));
    }
}

extension Operators_Vector4 on Vector4 {
    Vector4 operator +(dynamic other) {
        if (other is num) {
            return new Vector4(this.x + other, this.y + other, this.z + other, this.w + other);
        } else if (other is Vector4) {
            return this.add(other);
        }
        throw(ArgumentError("Invalid Vector4 addition: $this + $other"));
    }
    Vector4 operator -(dynamic other) {
        if (other is num) {
            return new Vector4(this.x - other, this.y - other, this.z - other, this.w - other);
        } else if (other is Vector4) {
            return this.subtract(other);
        }
        throw(ArgumentError("Invalid Vector4 subtraction: $this - $other"));
    }
    Vector4 operator *(dynamic other) {
        if (other is num) {
            return this.scale(other);
        } else if (other is Vector4) {
            return this.multiply(other);
        }
        throw(ArgumentError("Invalid Vector4 multiplication: $this * $other"));
    }
    Vector4 operator /(dynamic other) {
        if (other is num) {
            return this.scale(1.0/other);
        } else if (other is Vector4) {
            return this.divide(other);
        }
        throw(ArgumentError("Invalid Vector4 division: $this / $other"));
    }
}

extension Operators_Quaternion on Quaternion {
    Quaternion operator +(Quaternion other) => this.add(other);
    Quaternion operator -(Quaternion other) => this.subtract(other);
    Quaternion operator *(dynamic other) {
        if (other is num) {
            return this.scale(other);
        } else if (other is Quaternion) {
            return this.multiply(other);
        }
        throw(ArgumentError("Invalid Quaternion multiplication: $this * $other"));
    }
}