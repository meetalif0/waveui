---
order: 6
---

# FAQ

#### When does WaveUI support null safety?

We are already in the process of migrating null safety, but due to the large size of components, the attributes and interfaces of each component need to be evaluated, so support for null safety will be relatively lagging behind, so stay tuned.

#### How to find the compatible Flutter SDK version?

We will update the latest adaptation version to [pub.dev](https://pub.dev/packages/waveui/)

#### Possible reasons why theme customization does not take effect?

Please make sure to register in <code>main.dart</code>, if the correct registration still does not take effect, you can raise [issue](https://github.com/LianjiaTech/waveui/issues/new)

#### Will separate dependencies be provided for independent components?

WaveUI is output as a complete solution, so there is no component split, and the component will not be split in the future.

#### How to customize multi-channel theme?
You can refer to the [Theme Customization](./theme) section to register each channel configuration. You need to specify different <code>CONFIG_ID</code> when registering, and you must ensure that these <code>CONFIG_ID</code> are unique. When using it, take the corresponding configuration through the registered <code>CONFIG_ID</code> to take effect.

#### What if I don’t know how to use the Sketch plugin?

By reading this article [Sketch Design Guidelines](./sketch) you will quickly understand and complete your design.

#### What should I do if I encounter a problem?

You can submit [issue](https://github.com/LianjiaTech/waveui/issues/new) to us, here please refer to [issue specification](https://github.com/LianjiaTech/waveui/issues/3) to submit , we will regularly check the issues raised by everyone. If you already have a solution, please submit [pull request](https://github.com/LianjiaTech/waveui/pulls) to us.