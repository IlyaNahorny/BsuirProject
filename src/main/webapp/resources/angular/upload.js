$(document).on('click', '#close-preview', function () {
    $('.image-preview').popover('hide');
    // Hover befor close the preview
    $('.image-preview').hover(
        function () {
            $('.image-preview').popover('show');
        },
        function () {
            $('.image-preview').popover('hide');
        }
    );
});

$(function () {
    // Create the close button
    var closebtn = $('<button/>', {
        type: "button",
        text: 'x',
        id: 'close-preview',
        style: 'font-size: initial;'
    });
    closebtn.attr("class", "close pull-right");
    // Set the popover default content
    $('.image-preview').popover({
        trigger: 'manual',
        html: true,
        title: "<strong>Preview</strong>" + $(closebtn)[0].outerHTML,
        content: "There's no image",
        placement: 'bottom'
    });
    // Clear event
    $('.image-preview-clear').click(function () {
        $('.image-preview').attr("data-content", "").popover('hide');
        $('.image-preview-filename').val("");
        $('.image-preview-clear').hide();
        $('.image-preview-input input:file').val("");
        $(".image-preview-input-title").text("Browse");
    });
    // Create the preview image
    $(".image-preview-input input:file").change(function () {
        var img = $('<img/>', {
            id: 'dynamic',
            width: 250,
            height: 200
        });
        var file = this.files[0];
        var reader = new FileReader();
        // Set preview image into the popover data-content
        reader.onload = function (e) {
            $(".image-preview-input-title").text("Change");
            $(".image-preview-clear").show();
            $(".image-preview-filename").val(file.name);
            img.attr('src', e.target.result);
            $(".image-preview").attr("data-content", $(img)[0].outerHTML).popover("show");
        };
        reader.readAsDataURL(file);
    });
});

var image_file = '';

function init(f){
    image_file = f;
}

function upload() {
    if (!image_file || !image_file.type.match(/image.*/)) return alert("Select a photo");
    var fd = new FormData();
    fd.append("image", image_file);
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "https://api.imgur.com/3/upload/ilya");
    xhr.onload = function() {
        var respons= JSON.parse(xhr.responseText).data.link;
        console.log(respons);

        $.ajax({
            type : "POST",
            contentType : "application/json",
            url : "/update/image",
            data : JSON.stringify(respons),
            dataType : 'json',
            success : function() {
                alert("SUCCESS");
            },
            error : function() {
                alert("ERROR");
            }
        });

    };

    xhr.setRequestHeader('Authorization', 'Client-ID 66049bb357c7e64');
    xhr.send(fd);
}
