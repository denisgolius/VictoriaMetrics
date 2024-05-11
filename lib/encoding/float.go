package encoding

import (
	"sync"
)

// GetFloat64s returns a slice of float64 values with the given size.
//
// When the returned slice is no longer needed, it is advised calling PutFloat64s() on it,
// so it could be re-used.
func GetFloat64s(size int) *Float64s {
	v := float64sPool.Get()
	if v == nil {
		v = &Float64s{}
	}
	a := v.(*Float64s)
	if n := len(a.A) + size - cap(a.A); n > 0 {
		a.A = append(a.A[:cap(a.A)], make([]float64, n)...)
	}
	a.A = a.A[:size]
	return a
}

// PutFloat64s returns a to the pool, so it can be re-used via GetFloat64s.
//
// The a cannot be used after returning to the pull.
func PutFloat64s(a *Float64s) {
	a.A = a.A[:0]
	float64sPool.Put(a)
}

var float64sPool sync.Pool

// Float64s holds an array of float64 values.
type Float64s struct {
	A []float64
}
