from django.shortcuts import render

# Create your views here.
def test(request):
    return render(request, 'basic_app/base.html')

def homepage(request):
    return render(request, '')
