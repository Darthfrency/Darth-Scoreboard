const emojis={
    "police":"🚔",
    "sceriffi":"⭐",
    "ambulance":"🚑",
    "import":"📦",
    "meccanico":"🔧",
    "armeria":"🔫",
    
}

$(function () {
    function setItems(items){   
        console.log(document.getElementById("police").innerHTML)
        document.getElementById("police").innerHTML = emojis["police"]+items[0].toString(); 
        document.getElementById("sceriffi").innerHTML = emojis["sceriffi"]+items[1].toString();
        document.getElementById("ambulance").innerHTML = emojis["ambulance"]+items[2].toString();  
        document.getElementById("import").innerHTML = emojis["import"]+items[3].toString(); 
        document.getElementById("meccanico").innerHTML = emojis["meccanico"]+items[4].toString();
        document.getElementById("armeria").innerHTML = emojis["armeria"]+items[5].toString();  
        }



    function display(bool) {
        if (bool) {
            document.getElementById("container").classList.add('animate');
            document.getElementById("container").classList.remove('disappear');
        } else {
            document.getElementById("container").classList.add('disappear');
            document.getElementById("container").classList.remove('animate');
            //$("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                setItems(item.scores)
                display(true)
            } else {
                display(false)
            }
        }
    })
    // if the person uses the escape key, it will exit the resource
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('http://nui2/exit', JSON.stringify({}));
            return
        }
    };
    //when the user clicks on the submit button, it will run
   
})
