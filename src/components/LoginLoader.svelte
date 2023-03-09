<script>
    import Loader from "./Loader.svelte";
</script>

<Loader this={() => import("./Login.svelte")}>
    <div class="skeleton-wrapper" slot="fallback">
        <div class="skeleton"><p>&nbsp;</p></div>
    </div>
</Loader>

<style>
    p {
        padding: 0.69rem 1rem;
        margin: 0;
    }
    .skeleton-wrapper {
        display: flex;
        flex-direction: column;
        overflow: hidden;
        line-height: 1.6;
        text-align: justify;
        margin: 1rem 0;
        padding: 0.05rem;
        border-radius: 0.4rem;
        box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1),
            0 2px 4px -2px rgba(0, 0, 0, 0.1);
    }
    .skeleton {
        background-color: #fff;
        height: 100%;
        border-radius: 0.6rem;
        animation: skeleton-loading 1.2s ease-in-out infinite;
    }
    @keyframes skeleton-loading {
        0% {
            transform: translateX(-100%);
        }
        100% {
            transform: translateX(100%);
        }
    }
</style>
